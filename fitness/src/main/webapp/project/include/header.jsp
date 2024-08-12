<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div id="app">
<header id="header">
    <div class="header-wrap">
        <nav class="gnb left-gnb">
            <ul>
                <li><a href="javascript:alert('준비중입니다.');">스포츠 클럽</a></li>
                <li><a href="./location.jsp">지점찾기</a></li>
                <li><a href="javascript:alert('준비중입니다.');">프로그램</a></li>
            </ul>
        </nav>
        <div class="logo-wrap">
            <h1 class="logo">
                <a href="./index.html">
                    <svg width="286" height="19" viewBox="0 0 286 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M18.0078 17.7422C17.0156 18.0234 15.9453 18.2227 14.7969 18.3398C13.6484 18.4648 12.3281 18.5273 10.8359 18.5273C9.34375 18.5273 7.71094 18.3906 5.9375 18.1172C4.16406 17.8516 2.49609 17.4609 0.933594 16.9453C0.964844 16.8125 1.34375 15.3477 2.07031 12.5508C2.07031 12.4961 2.10156 12.4688 2.16406 12.4688C3.57031 12.8203 4.64844 13.0781 5.39844 13.2422C7.39062 13.6797 9.51953 13.8984 11.7852 13.8984C13.0273 13.8984 13.6484 13.6836 13.6484 13.2539C13.6484 13.0586 13.5859 12.9219 13.4609 12.8438C13.3359 12.7578 13.1172 12.6914 12.8047 12.6445C12.4922 12.5977 11.9883 12.5234 11.293 12.4219C10.5977 12.3125 10.0664 12.2266 9.69922 12.1641C9.33203 12.1016 8.81641 12.0117 8.15234 11.8945C7.48828 11.7773 6.98047 11.6719 6.62891 11.5781C6.28516 11.4844 5.83984 11.3633 5.29297 11.2148C4.75391 11.0586 4.33594 10.9023 4.03906 10.7461C3.74219 10.5898 3.39844 10.4023 3.00781 10.1836C2.61719 9.96484 2.32031 9.73047 2.11719 9.48047C1.89844 9.23047 1.6875 8.94922 1.48438 8.63672C1.10938 8.06641 0.921875 7.36719 0.921875 6.53906C0.921875 4.38281 1.91406 2.86328 3.89844 1.98047C5.88281 1.08984 8.82812 0.644531 12.7344 0.644531C14.3438 0.644531 15.9844 0.8125 17.6562 1.14844C19.3359 1.48438 20.5664 1.84375 21.3477 2.22656C20.9102 3.88281 20.5234 5.21875 20.1875 6.23438C19.2578 5.97656 17.9141 5.72266 16.1562 5.47266C14.3984 5.21484 12.8359 5.08594 11.4688 5.08594C10.1094 5.08594 9.42969 5.30469 9.42969 5.74219C9.42969 5.99219 9.60156 6.17969 9.94531 6.30469C10.2969 6.42188 11.1289 6.58984 12.4414 6.80859C13.7617 7.01953 14.6484 7.16406 15.1016 7.24219C18.4766 7.82031 20.6406 8.67188 21.5938 9.79688C22.2969 10.6328 22.6484 11.5312 22.6484 12.4922C22.6562 13.4531 22.4688 14.2734 22.0859 14.9531C21.7109 15.6328 21.1875 16.1953 20.5156 16.6406C19.8438 17.0859 19.0078 17.4531 18.0078 17.7422ZM37.6737 12.832L33.3847 12.7617L33.1386 17.8945C29.662 18.0352 27.4745 18.1055 26.5761 18.1055C25.6777 18.1055 25.1698 18.0898 25.0527 18.0586C25.0761 17.7773 25.0956 17.3594 25.1112 16.8047L25.1464 14.8359C25.1855 13.7422 25.2948 9.17969 25.4745 1.14844C29.5448 0.914062 33.7089 0.796875 37.9667 0.796875C40.9277 0.796875 43.205 1.21094 44.7987 2.03906C46.8612 3.11719 47.8886 4.76953 47.8808 6.99609C47.8808 10.8867 44.4784 12.832 37.6737 12.832ZM39.5136 6.91406C39.5136 6.1875 39.2597 5.75 38.7519 5.60156C38.2519 5.45312 37.5605 5.37891 36.6777 5.37891C35.8027 5.37891 34.8066 5.4375 33.6894 5.55469C33.58 6.78125 33.5253 7.84766 33.5253 8.75391C33.6503 8.80078 34.4706 8.82422 35.9862 8.82422C38.3378 8.82422 39.5136 8.1875 39.5136 6.91406ZM64.242 6.82031C64.242 5.91406 63.2967 5.46094 61.4061 5.46094C60.7967 5.46094 59.8983 5.48438 58.7108 5.53125L58.5116 8.83594C58.8397 8.79688 59.3631 8.74609 60.0819 8.68359C60.8084 8.62109 61.4725 8.54688 62.0741 8.46094C62.6756 8.36719 63.1873 8.19922 63.6092 7.95703C64.0311 7.70703 64.242 7.32812 64.242 6.82031ZM64.6405 19.0078C64.3514 18.4688 63.7772 17.3164 62.9178 15.5508C62.0662 13.7852 61.4959 12.5586 61.2069 11.8711L58.3358 12.0703L58.1014 17.8945C58.1014 17.957 58.0741 17.9922 58.0194 18C55.6444 18.0391 53.8709 18.0781 52.6991 18.1172L49.9569 18.2109C49.9569 17.0703 50.035 14.4766 50.1912 10.4297L50.2616 8.49609L50.6131 1.18359C50.6209 1.19141 50.6678 1.1875 50.7537 1.17188C52.0975 0.984375 54.5272 0.890625 58.0428 0.890625C61.5584 0.890625 63.7694 0.898438 64.6756 0.914062C65.5897 0.945313 66.4881 1.03125 67.3709 1.17188C70.8397 1.72656 72.5741 3.22266 72.5741 5.66016C72.5741 7.02734 72.1561 8.10547 71.3202 8.89453C70.492 9.67578 69.5155 10.2539 68.3905 10.6289C68.8905 11.1992 69.8475 12.4531 71.2616 14.3906C72.6834 16.3203 73.5272 17.4492 73.7928 17.7773L64.6405 19.0078ZM88.0564 13.7695C89.4314 13.7695 90.4822 13.3984 91.2087 12.6562C91.9431 11.9141 92.3103 10.8164 92.3103 9.36328C92.3103 7.90234 91.9392 6.89453 91.197 6.33984C90.4548 5.78516 89.4314 5.50781 88.1267 5.50781C86.822 5.50781 85.7869 5.87109 85.0212 6.59766C84.2634 7.31641 83.8845 8.36328 83.8845 9.73828C83.8845 12.4258 85.2752 13.7695 88.0564 13.7695ZM74.4978 9.92578C74.4978 6.94141 75.7048 4.64844 78.1189 3.04688C80.5408 1.44531 83.8923 0.644531 88.1736 0.644531C92.4548 0.644531 95.7634 1.38672 98.0994 2.87109C100.435 4.35547 101.603 6.45703 101.603 9.17578C101.603 12.1211 100.365 14.418 97.8884 16.0664C95.4119 17.707 92.0291 18.5273 87.74 18.5273C83.4509 18.5273 80.1697 17.7656 77.8962 16.2422C75.6306 14.7109 74.4978 12.6055 74.4978 9.92578ZM116.324 17.9531C116.324 17.9531 113.652 18.0273 108.308 18.1758L108.554 10.1602C108.617 8.22266 108.675 6.73047 108.73 5.68359H102.332C102.347 5.35547 102.406 4.65625 102.507 3.58594C102.609 2.51562 102.703 1.70703 102.789 1.16016C110.031 1.06641 115.062 1.01953 117.882 1.01953C120.711 1.01953 122.644 1.03125 123.683 1.05469C123.441 3.13281 123.164 4.67578 122.851 5.68359H116.746L116.675 8.21484C116.433 13.8945 116.312 16.9375 116.312 17.3438C116.312 17.7422 116.316 17.9453 116.324 17.9531ZM141.369 17.7422C140.377 18.0234 139.306 18.2227 138.158 18.3398C137.009 18.4648 135.689 18.5273 134.197 18.5273C132.705 18.5273 131.072 18.3906 129.298 18.1172C127.525 17.8516 125.857 17.4609 124.295 16.9453C124.326 16.8125 124.705 15.3477 125.431 12.5508C125.431 12.4961 125.463 12.4688 125.525 12.4688C126.931 12.8203 128.009 13.0781 128.759 13.2422C130.752 13.6797 132.88 13.8984 135.146 13.8984C136.388 13.8984 137.009 13.6836 137.009 13.2539C137.009 13.0586 136.947 12.9219 136.822 12.8438C136.697 12.7578 136.478 12.6914 136.166 12.6445C135.853 12.5977 135.349 12.5234 134.654 12.4219C133.959 12.3125 133.427 12.2266 133.06 12.1641C132.693 12.1016 132.177 12.0117 131.513 11.8945C130.849 11.7773 130.341 11.6719 129.99 11.5781C129.646 11.4844 129.201 11.3633 128.654 11.2148C128.115 11.0586 127.697 10.9023 127.4 10.7461C127.103 10.5898 126.759 10.4023 126.369 10.1836C125.978 9.96484 125.681 9.73047 125.478 9.48047C125.259 9.23047 125.048 8.94922 124.845 8.63672C124.47 8.06641 124.283 7.36719 124.283 6.53906C124.283 4.38281 125.275 2.86328 127.259 1.98047C129.244 1.08984 132.189 0.644531 136.095 0.644531C137.705 0.644531 139.345 0.8125 141.017 1.14844C142.697 1.48438 143.927 1.84375 144.709 2.22656C144.271 3.88281 143.884 5.21875 143.548 6.23438C142.619 5.97656 141.275 5.72266 139.517 5.47266C137.759 5.21484 136.197 5.08594 134.83 5.08594C133.47 5.08594 132.791 5.30469 132.791 5.74219C132.791 5.99219 132.963 6.17969 133.306 6.30469C133.658 6.42188 134.49 6.58984 135.802 6.80859C137.123 7.01953 138.009 7.16406 138.463 7.24219C141.838 7.82031 144.002 8.67188 144.955 9.79688C145.658 10.6328 146.009 11.5312 146.009 12.4922C146.017 13.4531 145.83 14.2734 145.447 14.9531C145.072 15.6328 144.548 16.1953 143.877 16.6406C143.205 17.0859 142.369 17.4531 141.369 17.7422ZM151.017 9.75C151.017 7 152.103 4.87109 154.275 3.36328C156.876 1.55078 160.517 0.644531 165.197 0.644531C166.009 0.644531 166.763 0.683594 167.458 0.761719V6.31641C166.435 6.17578 165.326 6.10547 164.13 6.10547C162.943 6.10547 161.962 6.39062 161.189 6.96094C160.423 7.53125 160.04 8.4375 160.04 9.67969C160.04 12.3047 161.443 13.6172 164.247 13.6172C164.958 13.6172 166.029 13.4805 167.458 13.207V18.3516C166.396 18.4688 165.31 18.5273 164.201 18.5273C158.458 18.5273 154.533 17.1523 152.423 14.4023C151.486 13.1836 151.017 11.6328 151.017 9.75ZM190.863 18.1055H183.398L170.003 18.0117L170.202 13.8867C170.601 5.61328 170.8 1.37109 170.8 1.16016C171.738 1.12109 172.351 1.10156 172.64 1.10156H184.499C187.132 1.10156 189.261 1.08594 190.886 1.05469L190.406 5.47266C188.515 5.64453 184.749 5.73047 179.109 5.73047C179.085 5.91797 179.058 6.23438 179.027 6.67969C179.003 7.125 178.984 7.46094 178.968 7.6875C181.218 7.64844 182.788 7.62891 183.679 7.62891L186.257 7.69922C186.257 8.04297 186.202 8.63672 186.093 9.48047C185.992 10.3242 185.878 10.9766 185.753 11.4375C185.628 11.4688 184.656 11.4844 182.835 11.4844H178.816L178.687 13.7695L190.992 13.9102C190.992 15.3867 190.968 16.4414 190.921 17.0742C190.882 17.6992 190.863 18.043 190.863 18.1055ZM192.224 1.23047L202.642 1.00781C202.728 1.10938 203.497 1.97266 204.95 3.59766C206.404 5.21484 207.759 6.73828 209.017 8.16797V3.01172C209.033 2.12891 209.056 1.5 209.087 1.125L216.072 1.04297L216.095 6.77344C216.095 8.1875 216.079 10.1523 216.048 12.668L216.013 15.3281L216.036 17.2734C215.872 17.3047 215.298 17.375 214.314 17.4844C213.337 17.5859 211.228 17.9336 207.986 18.5273L199.255 10.6992C199.146 14.9727 199.091 17.3164 199.091 17.7305V17.8594C198.693 17.8672 197.611 17.9102 195.845 17.9883C194.087 18.0664 192.732 18.1055 191.779 18.1055C191.818 17.5352 191.837 16.832 191.837 15.9961C191.837 15.1523 191.9 13.4883 192.025 11.0039C192.158 8.51172 192.224 6.63672 192.224 5.37891V1.23047ZM231.015 17.9531C231.015 17.9531 228.343 18.0273 222.999 18.1758L223.245 10.1602C223.308 8.22266 223.366 6.73047 223.421 5.68359H217.023C217.038 5.35547 217.097 4.65625 217.198 3.58594C217.3 2.51562 217.394 1.70703 217.48 1.16016C224.722 1.06641 229.753 1.01953 232.573 1.01953C235.402 1.01953 237.335 1.03125 238.374 1.05469C238.132 3.13281 237.855 4.67578 237.542 5.68359H231.437L231.366 8.21484C231.124 13.8945 231.003 16.9375 231.003 17.3438C231.003 17.7422 231.007 17.9453 231.015 17.9531ZM259.962 18.1055H252.497L239.103 18.0117L239.302 13.8867C239.7 5.61328 239.9 1.37109 239.9 1.16016C240.837 1.12109 241.45 1.10156 241.739 1.10156H253.599C256.232 1.10156 258.36 1.08594 259.985 1.05469L259.505 5.47266C257.614 5.64453 253.849 5.73047 248.208 5.73047C248.185 5.91797 248.157 6.23438 248.126 6.67969C248.103 7.125 248.083 7.46094 248.068 7.6875C250.318 7.64844 251.888 7.62891 252.778 7.62891L255.357 7.69922C255.357 8.04297 255.302 8.63672 255.193 9.48047C255.091 10.3242 254.978 10.9766 254.853 11.4375C254.728 11.4688 253.755 11.4844 251.935 11.4844H247.915L247.786 13.7695L260.091 13.9102C260.091 15.3867 260.068 16.4414 260.021 17.0742C259.982 17.6992 259.962 18.043 259.962 18.1055ZM276.44 6.82031C276.44 5.91406 275.495 5.46094 273.605 5.46094C272.995 5.46094 272.097 5.48438 270.909 5.53125L270.71 8.83594C271.038 8.79688 271.562 8.74609 272.28 8.68359C273.007 8.62109 273.671 8.54688 274.272 8.46094C274.874 8.36719 275.386 8.19922 275.808 7.95703C276.23 7.70703 276.44 7.32812 276.44 6.82031ZM276.839 19.0078C276.55 18.4688 275.976 17.3164 275.116 15.5508C274.265 13.7852 273.694 12.5586 273.405 11.8711L270.534 12.0703L270.3 17.8945C270.3 17.957 270.272 17.9922 270.218 18C267.843 18.0391 266.069 18.0781 264.897 18.1172L262.155 18.2109C262.155 17.0703 262.233 14.4766 262.39 10.4297L262.46 8.49609L262.812 1.18359C262.819 1.19141 262.866 1.1875 262.952 1.17188C264.296 0.984375 266.726 0.890625 270.241 0.890625C273.757 0.890625 275.968 0.898438 276.874 0.914062C277.788 0.945313 278.687 1.03125 279.569 1.17188C283.038 1.72656 284.772 3.22266 284.772 5.66016C284.772 7.02734 284.355 8.10547 283.519 8.89453C282.69 9.67578 281.714 10.2539 280.589 10.6289C281.089 11.1992 282.046 12.4531 283.46 14.3906C284.882 16.3203 285.726 17.4492 285.991 17.7773L276.839 19.0078Z" fill="black"/>
                    </svg>
                </a>
            </h1>
        </div>
        <nav class="gnb right-gnb">
            <ul>
                <li><a href="./class.jsp">강의목록</a></li>
                <li><a href="./join.jsp">회원가입</a></li>
                <c:choose>
                	<c:when test="${not empty sessionScope.userId}">
		                <li><a href="./login.jsp">로그아웃</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="./login.jsp">로그인</a></li>
                	</c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</header>
	
</body>
</html>