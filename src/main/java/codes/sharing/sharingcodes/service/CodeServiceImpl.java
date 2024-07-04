package codes.sharing.sharingcodes.service;

import codes.sharing.sharingcodes.dto.DateDTO;
import codes.sharing.sharingcodes.exceptions.NotFoundSnippet;
import codes.sharing.sharingcodes.model.Code;
import codes.sharing.sharingcodes.repository.CodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class CodeServiceImpl implements CodeService{
    private final CodeRepository repo;

    public CodeServiceImpl(@Autowired CodeRepository repo) {
        this.repo = repo;
    }

    @Override
    public Code getById(String id) {
        Code code = repo.findById(id).orElseThrow(() -> new NotFoundSnippet(id));
        if (code.hasLimit()) {
            refresh(code);
        }
        return repo.findById(id).orElseThrow(() -> new NotFoundSnippet(id));
    }

    @Override
    public void putCode(Code newCode) {
        Code code = new Code(newCode);
        System.out.printf("The code with UUID %s was created\n", code.getId());
        repo.save(code);
    }

    @Override
    public List<Code> getLatestNCode(int n) {
        List<Code> codes = (List<Code>) repo.findAll();

        List<Code> newCodes = new CopyOnWriteArrayList<>();

        int count = 0;

        for (int i = codes.size() - 1; i >= 0; i--) {
            Code c = codes.get(i);
            if (c.hasLimit()) {
                continue;
            }
            newCodes.add(c);
            if (++count == n) {
                break;
            }
        }

        return newCodes;
    }

    @Override
    public boolean isExist(String id) {
        return repo.existsById(id);
    }

    @Override
    public void deleteById(String id) {
        repo.deleteById(id);
    }

    @Override
    public List<Code> superGetAll() {
        return (List<Code>) repo.findAll();
    }

    private void refresh(Code code) {
        if (code.isViewsLimit() && code.getViews() >= 0) {
            code.setViews(code.getViews() - 1);
            if (code.getViews() < 0) {
                repo.delete(code);
                return;
            }
        }

        if (code.isTimeLimit() && code.getTime() >= 0) {
            code.setTime(code.getInitialTime() - ChronoUnit.SECONDS.between(LocalDateTime.parse(code.getDate()),
                    LocalDateTime.now()));
            if (code.getTime() < 0) {
                repo.delete(code);
                return;
            }
        }

        repo.save(code);
    }

    @Override
    public DateDTO formatDate(String date) throws IllegalArgumentException {
        String dateFormat;
        String timeFormat;

        Pattern patternDate = Pattern.compile("^.*?(?=T)");
        Matcher matcherDate = patternDate.matcher(date);
        Pattern patternTime = Pattern.compile("(?<=T)([^.]+)");
        Matcher matcherTime = patternTime.matcher(date);

        if (matcherDate.find() && matcherTime.find()) {
            dateFormat = matcherDate.group();
            timeFormat = matcherTime.group();
        } else {
            throw new IllegalArgumentException(String.format("Invalid string date: %s", date));
        }

        return new DateDTO(dateFormat, timeFormat);
    }
}
