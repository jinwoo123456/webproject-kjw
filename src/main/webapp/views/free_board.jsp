<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Welcome to ForumStack !</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/bulma.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.materialdesignicons.com/3.2.89/css/materialdesignicons.min.css"
    />
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>
  <body>
   
   <%--================================== 메뉴바================================== --%>
    <nav class="navbar forum" role="navigation" aria-label="main navigation">
      <div class="container">
        <div class="navbar-brand">
          <a class="navbar-item" href="">
            <h5 class="title is-5">김진우게시판</h5>
          </a>
          <a
            role="button"
            class="navbar-burger burger"
            aria-label="menu"
            aria-expanded="false"
            data-target="navbarBasicExample"
          >
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
          </a>
        </div>
        <div id="navbarBasicExample" class="navbar-menu">
          <div class="navbar-start">
            <a href="#" class="navbar-item"> Home </a>
            <a href="#" class="navbar-item"> About </a>
          </div>
          <div class="navbar-end">
            <div class="navbar-item">
<%--====================== 회원가입/로그인 버튼구역 ======================================= --%>

 <c:choose>
        <c:when test="${sessionScope.UserId != null}">
            <!-- 로그인 상태 -->
            <div class="buttons">
           <a class="button is-primary">
                <p> ${UserId}님 환영합니다! </p></a>
                <form
                          id="frmNIDLogout"
                          name="logoutFrm"
                          target="_top" 
                          autocomplete="off"
                          action="logout.do"
                          method="GET"
                          onsubmit="return validateForm(this);"
                          >
            <button type="submit" class="button is-light" > 로그아웃 </button>
            
            </form>
            <form
            name="member_updateFrm"
            action="member_update.jsp"
            method="GET"
           onsubmit="return validateForm(this);"
            >
            <button type="submit" class="button is-light" style = "margin-left:9px;" > 정보 수정 </button>
            </form>
            </div>
        </c:when>
        <c:otherwise>
            <!-- 비로그인 상태 -->
            <div class="buttons">
                <a class="button is-primary" href="./join.jsp">
                    <strong>  회원가입 </strong>
                </a>
                <a class="button is-light" href="./login.jsp"> 로그인 </a>
            </div>
        </c:otherwise>
    </c:choose>
            </div>
          </div>
        </div>
      </div>
    </nav>
<%--========== 회원가입/로그인 버튼구역 끝======================================= --%>


    <section class="hero is-primary">
      <div class="hero-body">
        <div class="container hero-forum has-text-centered">
          <h1 class="title">Forum Stack</h1>
          <h2 class="subtitle">all tech addicts can ask here :)</h2>
          <div class="field is-grouped">
            <p class="control is-expanded">
              <input
                class="input is-medium"
                type="text"
                placeholder="Find a great content"
              />
            </p>
            <p class="control">
              <a class="button is-medium is-info"> Search </a>
            </p>
          </div>
        </div>
      </div>
    </section>
    <br />
    <%--=================================== 게시판 누르면 이동되는 곳============================== --%>
    <div class="container">
      <div class="columns">
        <div class="column is-three-quarters">
          <div class="tabs forum">
            <ul>
              <li class="is-active"><a>자유게시판</a></li>
              <li><a href="qa_board.do">QA게시판</a></li>
              <li><a href="../views/file_board.do">자료실게시판</a></li>
              <li><a>인기 순위</a></li>
              <button class="tabs_btn"><a href="../views/free_board_write.jsp">글쓰기</a></button>
            </ul>
          </div>








          <%--===================================== 게시판 글폼================================== --%>
          
   <div class="container">
    
    <div class="box forum">
        <c:forEach var="freeboard" items="${freeBoardList}">
            <article class="media">
                <div class="media-left">
                    <figure class="image avatar is-64x64">
                        <img src="assets/img/1.png" alt="Image" class="is-rounded" />
                    </figure>
                </div>
                <div class="media-content">
                    <div class="content list-forum">
                        <div class="is-pulled-right has-text-centered">
                            <a href="#" class="love">
                                <span>
                                    <i class="mdi mdi-heart-outline"></i>
                                </span>
                            </a>
                            <span>${freeboard.like_count}</span>
                        </div>
                        <p class="text-content">
                            <a href="free_board_view.do?postId=${freeboard.post_id}">
                                ${freeboard.title}
                                <span class="solved" title="Solved">
                                    <i class="mdi mdi-checkbox-marked-circle"></i>
                                </span>
                            </a>
                        </p>
                        <p class="tags-content">
                            <a class="tag is-rounded is-primary">NuxtJS</a>
                            <a class="tag is-rounded is-success">VueJS</a>
                            <a class="tag is-rounded is-warning">JavaScript</a>
                        </p>
                        <p class="info-content">
                            <a>
                                <i class="mdi mdi-eye-outline"></i>
                                <small>${freeboard.visit_count}</small>
                            </a>
                            <a>
                                <i class="mdi mdi-comment-text-multiple-outline"></i>
                                <small>70</small>
                            </a>
                        </p>
                    </div>
                </div>
            </article>
        </c:forEach>
    </div>
</div>
          <%--===================================== 게시판 글폼 끝================================== --%>



          <%-- ===================================페이징 폼=================================== --%>
          <div class="box">
            <nav
              class="pagination is-rounded"
              role="navigation"
              aria-label="pagination"
            >
              <a class="pagination-previous">Previous</a>
              <a class="pagination-next">Next page</a>
              <ul class="pagination-list">
                <li>
                  <a class="pagination-link" aria-label="Goto page 1">1</a>
                </li>
                <li><span class="pagination-ellipsis">&hellip;</span></li>
                <li>
                  <a class="pagination-link" aria-label="Goto page 45">45</a>
                </li>
                <li>
                  <a
                    class="pagination-link is-current"
                    aria-label="Page 46"
                    aria-current="page"
                    >46</a
                  >
                </li>
                <li>
                  <a class="pagination-link" aria-label="Goto page 47">47</a>
                </li>
                <li><span class="pagination-ellipsis">&hellip;</span></li>
                <li>
                  <a class="pagination-link" aria-label="Goto page 86">86</a>
                </li>
              </ul>
            </nav>
          </div>
          </div>
          <%-- ===================================페이징 폼 끝=================================== --%>



        

         <%-- 컬럼 / 게시판 우측 태그 정보들 --%>
        <div class="column">
          <div class="box">
            <h5 class="title is-5"># POPULAR TAGS</h5>
            <div class="tags">
              <a class="tag is-rounded is-medium is-primary">HTML</a>
              <a class="tag is-rounded is-medium is-success">VueJS</a>
              <a class="tag is-rounded is-medium is-warning">JavaScript</a>
              <a class="tag is-rounded is-medium is-danger">Angular</a>
              <a class="tag is-rounded is-medium is-link">React</a>
              <a class="tag is-rounded is-medium is-success">NodeJS</a>
              <a class="tag is-rounded is-medium is-info">PHP</a>
              <a class="tag is-rounded is-medium is-success">CSS</a>
              <a class="tag is-rounded is-medium is-dark">DevOps</a>
            </div>
          </div>
        </div>


      </div> <%-- /div 위치  --%>
      <footer class="footer">
        <div class="content has-text-centered">
          <p>
            Copyright © 2018 - Design By
            <a target="_blank" href="https://nim4n136.github.io">NIM4N</a> FROM
            <b>
              <a target="_blank" href="https://iam-root.tech">IAMROOT TECH</a>
            </b>
          </p>
        </div>
      </footer>
    </div>
    <script src="js/script.js"></script>
  </body>
</html>
