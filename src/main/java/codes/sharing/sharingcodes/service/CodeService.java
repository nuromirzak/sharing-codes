package codes.sharing.sharingcodes.service;

import codes.sharing.sharingcodes.model.Code;

import java.util.List;

public interface CodeService {

    public Code getById(String id);

    public void putCode(Code newCode);

    public List<Code> getLatestNCode(int n);

    public boolean isExist(String id);

    public void deleteById(String id);

    public List<Code> superGetAll();
}