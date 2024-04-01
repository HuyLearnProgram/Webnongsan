package ecofarm.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        Cookie[] cookies = request.getCookies();
        boolean isLoggedIn = false;
        boolean isAdmin = false;
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userEmail".equals(cookie.getName())) {
                    isLoggedIn = true;
                } else if ("userRole".equals(cookie.getName()) && "ADMIN".equals(cookie.getValue())) {
                    isAdmin = true;
                }
            }
        }
        
        // Nếu đã đăng nhập và là admin, cho phép truy cập
        if (isLoggedIn && isAdmin) {
            return true;
        } else if (isLoggedIn && !isAdmin) {
            // Nếu đã đăng nhập nhưng không phải là admin, chuyển hướng đến trang chính (home page)
            response.sendRedirect(request.getContextPath() + "/index.htm");
            return false;
        } else {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login.htm");
            return false;
        }
    }
}

