package codes.sharing.sharingcodes.controller;

import codes.sharing.sharingcodes.dto.PasswordDTO;
import codes.sharing.sharingcodes.model.Code;
import codes.sharing.sharingcodes.service.CodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;

@Controller
public class PostController {
    private final CodeService codeService;

    public PostController(@Autowired CodeService codeService) {
        this.codeService = codeService;
    }

    @GetMapping(value = "/api/code/{N}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Object getNthApiCode(@PathVariable String N) {
        try {
            return codeService.getById(N);
        } catch (Exception e) {
            return Map.of("Error", e.getMessage());
        }
    }

    @PostMapping(value = "/api/code/new", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, String> createApiCode(@RequestBody Code newCode) {
        Code code = new Code(newCode);
        codeService.putCode(code);
        return Map.of("id", code.getId());
    }

    @GetMapping(value = "/api/code/latest", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Object getLatestApiCodes() {
        return codeService.getLatestNCode(10);
    }

    @PostMapping(value = "/api/code/password", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Object> checkPassword(@RequestBody PasswordDTO passwordDTO) {
        Code currentCode = codeService.getById(passwordDTO.getId());
        if (currentCode.getPassword().equals(passwordDTO.getPassword())) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }
}