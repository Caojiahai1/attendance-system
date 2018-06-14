package cc.filter;

import cc.common.WebConstants;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Create By CJH on 2018/5/3
 */
public class SessionFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 不过滤的uri
        String[] notFilter = new String[]{"login", "logout", "index.jsp", "userValidate", "login.jsp", "register"};

        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        String sss = servletRequest.getServletPath();
        if (servletRequest.getServletPath().endsWith(".css") || servletRequest.getServletPath().endsWith(".js") || servletRequest.getServletPath().endsWith(".jpg")) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }
        //当前请求路径
        String currentUrl = servletRequest.getRequestURI();
        int index = StringUtils.indexOf(currentUrl, "/", 0);
        String targetUrl = StringUtils.substring(currentUrl, StringUtils.indexOf(currentUrl, "/") + 1);

        //是否过滤
        Boolean doFilter = true;
        for (String s : notFilter) {
            if (currentUrl.length() > 0 && StringUtils.indexOf(targetUrl, s) != -1) {
                doFilter = false;
                break;
            }
        }

        if (doFilter) {
            HttpSession session = servletRequest.getSession();
            if (session.getAttribute(WebConstants.USER_SESSION_KEY) == null) {
                servletResponse.sendRedirect("/index.jsp");
            } else {
                chain.doFilter(servletRequest, servletResponse);
            }
        } else {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }
    }

    @Override
    public void destroy() {

    }
}