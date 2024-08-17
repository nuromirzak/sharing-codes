package codes.sharing.sharingcodes.service;

import codes.sharing.sharingcodes.dto.DateDTO;
import codes.sharing.sharingcodes.model.Code;

import java.util.List;

public interface CodeService {
    Code getById(String id);

    void putCode(Code newCode);

    void refreshCode(Code code);

    List<Code> getLatestNCode(int n);

    DateDTO formatDate(String date);
}
