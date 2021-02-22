'use strict'

var brd = brd || {}
brd = (() => {
	const init = x => {
		$('#write').click(e => {location.href=`${x}/move/brd/write`})
		$('#board-list').click(e => {location.href=`${x}/move/brd/list`})
	}
	const goHome = x => {location.href = `${x}/move/brd/index`}
	const write = x => {
		$.ajax({
			url: `${x}/boards`,
			type: `POST`,
			data: JSON.stringify({
				boardNum: 0,
			title: $('#title').val(),
			content: $('#content').val(),
			date: $('#date').val(),
			userid: $('#userid').val()
			}),
			dataType: 'json',
			contentType: 'application/json',
			success: d=> {
					alert(`게시글 등록 완료`)
					location.href=`${x}/move/brd/list`
			},
			error: e => {alert(`게시글 등록 실패: ${e}`)
			location.reload()
			}
		})
	}
	
	const list = x => {	
	$.getJSON(`${x}/boards/list`, d => { 
		$(`<h3/>`)
		.attr({id: `title`})
		.appendTo(`#brd-data`)
		$(`<table/>`)
		.attr({id: `tab`})
		.css({width: `100%`})
		.appendTo(`#title`) 
		$(`<tr/>`).attr({id: `tr_1`}).appendTo(`#tab`)
		$.each(
			[`No`,`제목`,`내용`,`날짜`,`작성자`], 
		    (i, j) => {
			$(`<th>${j}</th>`).css({backgroundColor: `#c1c7c7`, fontSize: `16px`})
			.appendTo(`#tr_1`)
		})
		$.each(d,
			(i, j) => {
				
			$(`<tr><td>${j.boardNum}</td>
					<td><a class="title" href="#" id="${j.boardNum}">${j.title}</a></td>
		   	    		<td>${j.content}</td>
						<td>${j.date}</td>
						<td>${j.userid}</td></tr>`)
						.css({padding: `20px`, textAlign: `center`, fontSize: `13px`, height: `25px`})
						.appendTo(`#tab`)
		})
		$(`.title`).each(function(){
                    $(this).click(e => {
                        e.preventDefault()
                        localStorage.setItem(`boardNum`, `${this.id}`)
                        location.href=`${x}/move/brd/detail`
                    })
                })
			})
		}
	const detail = x => {
        $.getJSON(`${x}/boards/${localStorage.getItem(`boardNum`)}`, d => {
            $(`#boardNum`).text(d.boardNum)
            $(`#title`).text(d.title)
            $(`#content`).text(d.content)
            $(`#date`).text(d.date)
            $(`#userid`).text(d.userid)
			$('#toggle').html('<button id="update-btn">수정</button>&nbsp;<button id="delete-btn">삭제</button>')

			 $('#update-btn').click(e => { 
                $('#title').html(`<input id="update-title" type="text" value="${d.title}"/>`)
                $('#content').html(`<input id="update-content" type="text" value="${d.content}"/>`)
                $('#date').html(`<input id="update-date" type="text" value="${d.date}"/>`)
                $('#userid').html(`<input id="update-id" type="text" value="${d.userid}"/>`)
                $('#toggle').html('<button id="confirm-btn">확인</button>&nbsp;<button id="cancel-btn">취소</button>')

	            $('#confirm-btn').click(e => {
	                e.preventDefault()
	                $.ajax({
	                    url: `${x}/boards`,
	                    type: 'PUT',
	                    data: JSON.stringify({
	                        boardNum: d.boardNum,
							title: $('#update-title').val(),
	                        content: $('#update-content').val(),
	                        date: $('#update-date').val(),
	                        userid: $('#update-id').val()
	                    }),
	                    dataType: 'json',
	                    contentType: 'application/json',
	                    success: d => {
							alert(`수정 완료`)
	                        location.href = `${x}/move/brd/detail`
	                    },
	                    error: e => {alert(`수정 실패: ${e}`)}
	                })
	            })
				$('#cancel-btn').click(e => {
					e.preventDefault()
					location.href = `${x}/move/brd/detail`
				})
		})
			
            $('#delete-btn').click(e => {
                e.preventDefault()
                $.ajax({
                    url: `${x}/boards`,
                    type: `DELETE`,
                    data: JSON.stringify({
                        boardNum: d.boardNum
                    }),
                    dataType: 'json',
                    contentType: 'application/json',
                    success: d => {
							alert(`삭제 완료`)
                            location.href = `${x}/move/brd/list`             
                    },
                    error: e => {
                        alert(`삭제 에러 발생: ${e}`)
                    }
                })
            })
        })
	}
	
	return {init, goHome, write, list, detail}
})()