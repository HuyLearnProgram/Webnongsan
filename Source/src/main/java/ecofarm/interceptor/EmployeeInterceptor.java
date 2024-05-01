package ecofarm.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class EmployeeInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        Cookie[] cookies = request.getCookies();
        boolean isLoggedIn = false;
        boolean isEmployee = false;
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userEmail".equals(cookie.getName())) {
                    isLoggedIn = true;
                } else if ("userRole".equals(cookie.getName()) && BCrypt.checkpw("EMPLOYEE", cookie.getValue())) {
                    isEmployee = true;
                }
            }
        }
        
        // Nếu đã đăng nhập và là emp, cho phép truy cập
        if (isLoggedIn && isEmployee) {
            return true;
        } else if (isLoggedIn && !isEmployee) {
            // Nếu đã đăng nhập nhưng không phải là emp, chuyển hướng đến trang chính (home page)
            response.sendRedirect(request.getContextPath() + "/index.htm");
            return false;
        } else {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login.htm");
            return false;
        }
    }
}


