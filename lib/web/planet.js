document.addEventListener('DOMContentLoaded', (event) => {
    // 모든 .my-button 클래스 요소를 선택
    const treeBtn = document.querySelector('.UpBtn');
    const mail = document.getElementById("mail"); 
    treeBtn.addEventListener('click', () => {
        const dialog = document.getElementById('myDialog');
        //var leafCount = document.getElementById("leafCount");
        var smile = document.getElementById("smile");
        const progress = document.querySelector('.planetGuage');

        //var leafCountValue = parseInt(leafCount.innerText);

        /*
        if (leafCountValue > 0) {
            leafCountValue -= 1;

            leafCount.innerText = leafCountValue;
        }*/

        smile.style.display = "flex";
        setTimeout(function () {
            smile.style.display = "none";
        }, 1500);

        // 게이지 10 증가
        let currentValue = parseInt(progress.value);

        let newValue = currentValue + 10;

        if (newValue >= progress.max) {
            newValue = progress.max;
            mail.style.visibility = "visible";
            dialog.showModal();
        }

        progress.value = newValue;

        document.getElementById("confirmDialogBtn").addEventListener('click', (event) => {
            dialog.close();
        });

    });
    
    console.log("ok");

    document.querySelector('.mailClass').addEventListener("click", function(){
        const treemail = document.getElementById("treeMail");
        treemail.showModal();
        document.getElementById("checkDialogBtn").addEventListener("click", function(){
            treemail.close();
        });
    });
    
});




