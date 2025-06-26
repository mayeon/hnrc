<style>
    .f_text strong{
        color: #999999;
        font-size: 16px;
    }
    .f_textul > li > p{
        font-size: 15px;
    }
    .f_text p{
        color: #999999;
    }

    .f_textul li {
        width: 100%;
        text-align: left;

        color: #999999;

        display: flex;
        flex-wrap: wrap;
        column-gap: 15px;

        margin: 0;
    }
    .f_text span{
        color: #999999;
        font-weight: 300;
    }
</style>
<footer>

    <div class="f_text">
        <div class="container">
            <strong>5G&6G 차세대 통신 네트워크 연구센터 <a style="font-size: 14px;" href="#">[관리자 로그인]</a></strong>

            <ul class="f_textul">
                <li>
                    <span>-</span>
                </li>
                <li>
                    <span>TEL : -</span><span>FAX : -</span>

                </li>

            </ul>
            <span> Copyright (C)THINKONWEB. All rights reserved.</span>

        </div>
    </div>
</footer>


<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>

    $(document).ready(function(){

        <c:if test="${not empty popup}">
        $("#customPopup").modal("show");
        </c:if>
    });

</script>




