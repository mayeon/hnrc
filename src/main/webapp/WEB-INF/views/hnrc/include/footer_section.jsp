<div id="footer">

    <%@include file="/WEB-INF/views/hnrc/include/footer.jsp" %>
</div>

<script>
    window.addEventListener('DOMContentLoaded', function() {
        // #wrap 요소와 #footer 요소 가져오기
        var wrap = document.getElementById('wrap');
        var footer = document.getElementById('footer');

        function updatePaddingBottom() {
            // #footer 요소의 높이 가져오기
            var footerHeight = footer.offsetHeight;

            // #wrap 요소의 padding-bottom 값을 업데이트
            wrap.style.paddingBottom = footerHeight + 'px';
        }

        // 페이지 로드 시 및 #footer 요소 크기 변경 시에도 업데이트
        window.addEventListener('resize', updatePaddingBottom);
        updatePaddingBottom(); // 페이지 로드 시 초기 업데이트
    });
</script>