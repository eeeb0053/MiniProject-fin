'use strict'
var uss = uss || {}
uss = (() => {
	const init = x => {
		$('#user-register').click(e => {location.href=`${x}/move/uss/register`})
        $('#user-login').click(e => {location.href=`${x}/move/uss/login`})
	}
	const goHome = x => {location.href = `${x}/move/uss/index`}
	const register = x => {
		$.ajax({
	          url: `${x}/users`,
	          type: 'POST',
	          data: JSON.stringify({
	              userid: $('#userid').val(),
	              password: $('#password').val(),
	              name: $('#name').val(),
	              email: $('#email').val(),
	              gender: $('#gender').val(),
	              birthday: $('#birthday').val(),
	              phoneNumber: $('#phoneNumber').val()
	          }),
	          dataType: 'json',
	          contentType: 'application/json',
	          success: d => {
				alert(`회원가입 완료`)
	            location.href = `${x}/move/uss/login`
	          },
	          error: e => {
	              console.log(`유저등록 실패: ${e.responseText}`)
	          }
	      })
	}
	
	const login = x => {
		$.ajax({
			url: `${x}/users/login`,
			type: `post`,
			data: JSON.stringify({userid: $(`#uid`).val(), password:$(`#pwd`).val()}),
			dataType: 'json',
			contentType: 'application/json',
			success: d => {
				sessionStorage.setItem(`loginUserNum`, d.userNum)
				location.href = `${x}/move/uss/detail`
			},
			error: e => {
				alert(`아이디와 패스워드를 확인해주세요.`)
			}
		})
	}
	
	const detail = x => {
	$.getJSON(`${x}/users/${sessionStorage.getItem('loginUserNum')}`, d => {
            $(`#userid`).text(d.userid)
            $(`#password`).text('******')
            $(`#username`).text(d.name)
            $(`#email`).text(d.email)
            $(`#gender`).text(d.gender)
            $(`#birthday`).text(d.birthday)
            $(`#phoneNumber`).text(d.phoneNumber)
			$('#toggle').html('<button id="update-btn">수정</button>&nbsp;<button id="delete-btn">탈퇴</button>')
    
			
            $('#update-btn').click(e => { 
				e.preventDefault()
                $('#userid').html(`<input id="update-userid" type="text" value="${d.userid}"/>`)
                $('#password').html(`<input id="update-password" type="password" value="${d.password}"/>`)
                $('#username').html(`<input id="update-name" type="text" value="${d.name}"/>`)
                $('#email').html(`<input id="update-email" type="text" value="${d.email}"/>`)
                $('#gender').html(`<input id="update-gender" type="text" value="${d.gender}"/>`)
                $('#birthday').html(`<input id="update-birthday" type="text" value="${d.birthday}"/>`)
                $('#phoneNumber').html(`<input id="update-phoneNumber" type="text" value="${d.phoneNumber}"/>`)
                $('#toggle').html('<button id="confirm-btn">확인</button>&nbsp;<button id="cancel-btn">취소</button>')
               
				$('#confirm-btn').click(e => {
                    e.preventDefault()
                    $.ajax({
                        url: `${x}/users`,
                        type: 'PUT',
                        data: JSON.stringify({
                            userNum: d.userNum,
                            userid: $('#update-userid').val(),
                            password: $('#update-password').val(),
                            name: $('#update-name').val(),
                            email: $('#update-email').val(),
                            gender: $('#update-gender').val(),
                            birthday: $('#update-birthday').val(),
                            phoneNumber: $('#update-phoneNumber').val()
                        }),
                        dataType: 'json',
                        contentType: 'application/json',
                        success: d => {
							alert(`수정되었습니다.`)
                            location.href = `${x}/move/uss/detail`
                        },
                        error: e => {alert(`수정 에러 발생: ${e}`)}
                    })
                })

				$('#cancel-btn').click(e => {
					e.preventDefault()
					location.href = `${x}/move/uss/detail`
				})
            })

            $('#delete-btn').click(e => {
                e.preventDefault()
                $.ajax({
                    url: `${x}/users`,
                    type: `DELETE`,
                    data: JSON.stringify({
                        userNum: d.userNum
                    }),
                    dataType: 'json',
                    contentType: 'application/json',
                    success: d => {
							alert(`탈퇴되셨습니다.`)
                            location.href = `${x}/move/uss/login`
                    },
                    error: e => {
                        alert(`삭제 에러 발생: ${e}`)
                    }
                })
            })
        })
	}
	
	return {init, goHome, login, register, detail}
})()
