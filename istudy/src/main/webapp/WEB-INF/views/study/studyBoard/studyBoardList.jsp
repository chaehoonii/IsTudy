<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/studyboard/studyboard.css" type="text/css">
<div class="studyboard_main">
	<h1>스터디 게시판</h1>
	<hr/>
	<div id="studyboard_list">
		<div id='studyboard_btn01'><span class='white_border'>&nbsp;(&nbsp;${totalStudyBoard}&nbsp;) 개의 글&nbsp;</span></div>
		<div id='studyboard_btn02' onclick="location.href='/studyBoard/studyBoardWrite'"><span class='gray_box'>&nbsp;글 작성&nbsp;</span></div>			
		<hr/>
	</div>
	<c:forEach var="vo" items="${studyBoardList}">
		<ul class='studyboard_ul' onclick="location.href='/studyBoard/studyBoardView?board_num=${vo.board_num}'">
			<li>${vo.title}</li>
		</ul>
	</c:forEach>
</div>

<!-- ------------포스트잇 보드-----------------  -->
<div id="outer">
	<div id="header">
		<h1>I sTudy<br/><span id="h1-span">- 자유 게시판 -</span></h1>	
	</div>
	<div id="react-container">
	</div>
</div>
<script src="/js/studyboard/bulletinBoard.js"></script>
<script type="text/babel">
    var Note = React.createClass({
        getInitialState() {
            return {editing: false}
        },
        componentWillMount() {
            this.style = {
                right: this.randomBetween(0, window.innerWidth - 150, 'px'),
                top: this.randomBetween(220, window.innerHeight - 150, 'px')
            }
        },
        componentDidUpdate() {
            if (this.state.editing) {
                this.refs.newText.focus()
                this.refs.newText.select()
            }
        },
        shouldComponentUpdate(nextProps, nextState) {
            return this.props.children !== nextProps.children || this.state !== nextState
        },
        randomBetween(x, y, s) {
            return (x + Math.ceil(Math.random() * (y - x))) + s
        },
        edit() {
            this.setState({editing: true})
        },
        save() {
            this.props.onChange(this.refs.newText.value, this.props.id)
            this.setState({editing: false})
        },
        remove() {
            this.props.onRemove(this.props.id)
        },
        renderForm() {
            return (
                <div className="note"
                     style={this.style}>
                        <textarea ref="newText"
                                  defaultValue={this.props.children}>
                        </textarea>
                    <button onClick={this.save}>SAVE</button>
                </div>
            )
        },
        renderDisplay() {
            return (
                <div className="note"
                     style={this.style}>
                    <p>{this.props.children}</p>
                    <span>
                            <button onClick={this.edit}>EDIT</button>
                            <button onClick={this.remove}>X</button>
                        </span>
                </div>
            )
        },
        render() {
            return ( <ReactDraggable>
                    {(this.state.editing) ? this.renderForm() : this.renderDisplay()}
                </ReactDraggable>
            )
        }
    })

    var Board = React.createClass({
        propTypes: {
            count: function (props, propName) {
                if (typeof props[propName] !== "number") {
                    return new Error('the count must be a number')
                }
                if (props[propName] > 100) {
                    return new Error('Creating ' + props[propName] + ' notes is ridiculous')
                }
            }
        },
        getInitialState() {
            return {
                notes: []
            }
            this.setState({notes})
        },
        componentWillMount() {
            if (this.props.count) {
                var url = `https://baconipsum.com/api/?type=all-meat&sentences=${this.props.count}` // back tick below ~ on keyboard (must be used)
                fetch(url)
                .then(results => results.json())
                .then(array => array[0])
                .then(text => text.split('. '))
                .then(array => array.forEach(
                    sentence => this.add(sentence)))
                .catch(function (err) {
                    console.log("Didn't connect to the API", err)
                })
            }
        },
        remove(id) {
            var notes = this.state.notes.filter(note => note.id !== id)
            this.setState({notes})
        },
        nextId() {
            this.uniqueId = this.uniqueId || 0
            return this.uniqueId++
        },
        add(text) {
            var notes = [
                ...this.state.notes,
                {
                    id: this.nextId(),
                    note: text
                }
            ]
            this.setState({notes})
        },
        update(newText, id) {
            var notes = this.state.notes.map(
                note => (note.id !== id) ?
                        note :
                    {
                        ...note,
                        note: newText
                    }
            )
            this.setState({notes})
        },
        eachNote(note) {
            return (<Note key={note.id}
                          id={note.id}
                          onChange={this.update}
                          onRemove={this.remove}>
                {note.note}
            </Note>)
        },
        render() {
            return (
                <div className="board">
                    {this.state.notes.map(this.eachNote)}
                    <button onClick={() => this.add('New Note')}>+</button>
                </div>
            )
        }
    })
    ReactDOM.render(<Board count={10}/>,
        document.getElementById("react-container"))
</script>
