package codes.sharing.sharingcodes.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class NotFoundSnippet extends RuntimeException {
    public NotFoundSnippet(String id) {
        super(String.format("Not found snippet with UUID %s", id));
    }
}