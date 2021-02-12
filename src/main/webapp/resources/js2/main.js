$(function(){
    $("#form-total").steps({
        headerTag: "h2",
        bodyTag: "section",
        transitionEffect: "fade",
        enableAllSteps: true,
        stepsOrientation: "vertical",
        autoFocus: true,
        transitionEffectSpeed: 500,
        titleTemplate : '<div class="title">#title#</div>',
        labels: {
            previous : 'Back Step',
            next : '<i class="zmdi zmdi-arrow-right"></i>',
            finish : '<i class="zmdi zmdi-check"></i>',
            current : ''
        },
    })
});
//Сокрытие и появления пароля
function show_hide_password(target){
    var input = document.getElementById('password-input');
    if (input.getAttribute('type') == 'password') {
        target.classList.add('view');
        input.setAttribute('type', 'text');
    } else {
        target.classList.remove('view');
        input.setAttribute('type', 'password');
    }
    return false;
}

function show_hide_password2(target){
    var input = document.getElementById('password-input2');
    if (input.getAttribute('type') == 'password') {
        target.classList.add('view2');
        input.setAttribute('type', 'text2');
    } else {
        target.classList.remove('view2');
        input.setAttribute('type', 'password');
    }
    return false;
}