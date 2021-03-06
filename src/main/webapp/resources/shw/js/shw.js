'use strict'
var shw = shw || {}
shw = (() => {
	const init = x => {
		$('#add').click(e => {location.href=`${x}/move/shw/add`})
        $('#show-list').click(e => {location.href=`${x}/move/shw/list`})
	}
	const goHome = x => {location.href = `${x}/move/shw/index`}
	const add = x => {
		$.ajax({
			url: `${x}/shows`,
			type: `POST`,
			data: JSON.stringify({
                title: $('#title').val(),
                period: $('#period').val(),
                time: $('#time').val(),
                venue: $('#venue').val(),
                admission: $('#admission').val(),
                price: $('#price').val(),
				host: $('#host').val(),
				management: $('#management').val(),
				inquiry: $('#inquiry').val()
			}),
			dataType: 'json',
            contentType: 'application/json',
            success: d => {
                    alert(`전시회 등록 완료`)
                    location.href=`${x}/move/shw/list`
            },
            error: e => { alert(`전시회 등록 실패: ${e}`)
							location.reload()
			}
		})
	}

	const list = x => {
		$.getJSON(`${x}/shows/list`, d => {
			$(`<h3/>`)
			.attr({id: `title`})
			.appendTo(`#shw-data`)
			$(`<table/>`)
			.attr({id: `tab`})
			.css({width: `100%`})
			.appendTo(`#title`) 
			$(`<tr/>`).attr({id: `tr_1`}).appendTo(`#tab`)
			$.each(
				[`No`,`제목`,`기간`,`시간`,`장소`], 
				(i,j) => {
					console.log(i);
				$(`<th>${j}</th>`).css({backgroundColor: `#c1c7c7`, fontSize: `16px`})
				.appendTo(`#tr_1`)
			})
			$.each(d, 
				(i, j) => {
					console.log(i);
						$(`<tr><td>${j.showNum}</td>
			   	    		<td><a class="title" href="#" id="${j.showNum}">${j.title}</a></td>
			   	    		<td>${j.period}</td>
							<td>${j.time}</td>
							<td>${j.venue}</td></tr>`)
							.css({padding: `15px`, textAlign: `left`, fontSize: `small`})
							.appendTo(`#tab`)
			})
			$(`.title`).each(function() {
                $(this).click(e => {
                    e.preventDefault()
                    localStorage.setItem(`showNum`, `${this.id}`)
                    location.href = `${x}/move/shw/detail`
				})
			})
		})
		
	}
	
	const detail = x => {
	$.getJSON(`${x}/shows/${localStorage.getItem(`showNum`)}`, d => {
            $(`#showNum`).text(d.showNum)
            $(`#title`).text(d.title)
            $(`#period`).text(d.period)
            $(`#time`).text(d.time)
            $(`#venue`).text(d.venue)
            $(`#admission`).text(d.admission)
            $(`#price`).text(d.price)
            $(`#host`).text(d.host)
            $(`#management`).text(d.management)
            $(`#inquiry`).text(d.inquiry)
			$('#toggle').html('<button id="update-btn">수정</button>&nbsp;<button id="delete-btn">삭제</button>')
    
			
            $('#update-btn').click(e => { 
				e.preventDefault()
                $('#title').html(`<input id="update-title" type="text" value="${d.title}"/>`)
                $('#period').html(`<input id="update-period" type="text" value="${d.period}"/>`)
                $('#time').html(`<input id="update-time" type="text" value="${d.time}"/>`)
                $('#venue').html(`<input id="update-venue" type="text" value="${d.venue}"/>`)
                $('#admission').html(`<input id="update-admission" type="text" value="${d.admission}"/>`)
                $('#price').html(`<input id="update-price" type="text" value="${d.price}"/>`)
                $('#host').html(`<input id="update-host" type="text" value="${d.host}"/>`)
                $('#management').html(`<input id="update-management" type="text" value="${d.management}"/>`)
                $('#inquiry').html(`<input id="update-inquiry" type="text" value="${d.inquiry}"/>`)
                $('#toggle').html('<button id="confirm-btn">확인</button>&nbsp;<button id="cancel-btn">취소</button>')
               
				$('#confirm-btn').click(e => {
                    e.preventDefault()
                    $.ajax({
                        url: `${x}/shows`,
                        type: 'PUT',
                        data: JSON.stringify({
                            showNum: d.showNum,
                            title: $('#update-title').val(),
                            period: $('#update-period').val(),
                            time: $('#update-time').val(),
                            venue: $('#update-venue').val(),
                            admission: $('#update-admission').val(),
                            price: $('#update-price').val(),
                            host: $('#update-host').val(),
                            management: $('#update-management').val(),
                            inquiry: $('#update-inquiry').val()
                        }),
                        dataType: 'json',
                        contentType: 'application/json',
                        success: d => {
							alert(`수정되었습니다.`)
                            location.href = `${x}/move/shw/detail`
                        },
                        error: e => {alert(`수정 에러 발생: ${e}`)}
                    })
                })

				$('#cancel-btn').click(e => {
					e.preventDefault()
					location.href = `${x}/move/shw/detail`
				})
            })

            $('#delete-btn').click(e => {
                e.preventDefault()
                $.ajax({
                    url: `${x}/shows`,
                    type: `DELETE`,
                    data: JSON.stringify({
                        showNum: d.showNum
                    }),
                    dataType: 'json',
                    contentType: 'application/json',
                    success: d => {
							alert(`삭제되었습니다.`)
                            location.href = `${x}/move/shw/list`
                    },
                    error: e => {
                        alert(`삭제 에러 발생: ${e}`)
                    }
                })
            })
        })
	}
	
	return {init, goHome, add, list, detail}
})()
