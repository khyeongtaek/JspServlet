package filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebFilter("/*")
@WebInitParam(name="encoding", value="UTF-8")
public class CharacterEncodingFilter implements Filter {
    private String encoding;

    @Override
    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter("encoding");
        System.out.println(" ========= CharacterEncodingFilter: " + encoding);
        if (encoding == null) {
            encoding = "UTF-8";
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        request.setCharacterEncoding(encoding);
        response.setContentType("text/html; charset="+encoding);

        chain.doFilter(request, response);
    }
}
