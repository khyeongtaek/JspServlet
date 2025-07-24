package controller.servlet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
public class ActionForward {
    private String view;
    private boolean isRedirect;
}
