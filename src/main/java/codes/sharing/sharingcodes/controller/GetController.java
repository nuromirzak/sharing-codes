package codes.sharing.sharingcodes.controller;

import codes.sharing.sharingcodes.dto.DateDTO;
import codes.sharing.sharingcodes.model.Code;
import codes.sharing.sharingcodes.service.CodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class GetController {
    private final CodeService codeService;

    public GetController(@Autowired CodeService codeService) {
        this.codeService = codeService;
    }

    @GetMapping("/code/{N}")
    public String getNthCode(@PathVariable String N, @RequestParam(value = "password", required = false) String password, Model model) {
        try {
            Code currentCode = codeService.getById(N);

            if (password == null) password = "";
            if (!password.equals(currentCode.getPassword())) {
                return "password";
            }
            codeService.refreshCode(currentCode);

            DateDTO dateDTO = codeService.formatDate(currentCode.getDate());
            model.addAttribute("pieceOfCode", currentCode);
            model.addAttribute("dateDTO", dateDTO);
            return "getcode";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "customerror";
        }
    }

    @GetMapping(value = {"/code/new", "/"})
    public String createHtmlCode() {
        return "index";
    }

    @GetMapping("/code/latest")
    public String getLatestHtmlCodes(Model model) {
        List<Code> newCodes = codeService.getLatestNCode(10);
        model.addAttribute("latestCodes", newCodes);
        return "recent";
    }

    @GetMapping("/code/about")
    public String getAboutPage() {
        return "about";
    }

    @GetMapping("/code/usage")
    public String getUsage() {
        return "usage";
    }
}
