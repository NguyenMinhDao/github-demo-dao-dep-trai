const quizData = [
    {
        question: "What is Java?",
        a: "A programming language",
        b: "A coffee brand",
        c: "An operating system",
        d: "A type of car",
        correct: "a"
    },
    {
        question: "What is the main feature of Java that makes it platform-independent?",
        a: "Garbage collection",
        b: "Object-oriented programming",
        c: "Bytecode and JVM",
        d: "Multi-threading",
        correct: "c",
    },
    {
        question: "What is the keyword used to define a constant variable in Java?",
        a: "constant",
        b: "const",
        c: "final",
        d: "static",
        correct: "c",
    },
    {
        question: "Which data type is used to represent whole numbers in Java?",
        a: "int",
        b: "double",
        c: "char",
        d: "boolean",
        correct: "a",
    },
    {
        question: "What is the output of the following code?\nint x = 5;\nSystem.out.println(x++);",
        a: "5",
        b: "6",
        c: "4",
        d: "Error",
        correct: "a",
    },
    {
        question: "Which Java keyword is used to create an instance of a class?",
        a: "create",
        b: "instantiate",
        c: "new",
        d: "instance",
        correct: "c",
    },
    {
        question: "What is the default value of a boolean variable in Java?",
        a: "true",
        b: "false",
        c: "null",
        d: "0",
        correct: "b",
    },
    {
        question: "Which loop is guaranteed to execute at least once in Java?",
        a: "for loop",
        b: "while loop",
        c: "do-while loop",
        d: "if-else statement",
        correct: "c",
    },
    {
        question: "What does the 'static' keyword mean in Java?",
        a: "The variable can only be accessed within the class",
        b: "The variable is shared among all instances of the class",
        c: "The variable can be modified at runtime",
        d: "The variable cannot be modified after initialization",
        correct: "b",
    },
    {
        question: "What is the superclass of all classes in Java?",
        a: "Object",
        b: "Superclass",
        c: "Base",
        d: "Parent",
        correct: "a",
    },
];

const quiz = document.getElementById('quiz')
const answerEls = document.querySelectorAll('.answer')
const questionEl = document.getElementById('question')
const a_text = document.getElementById('a_text')
const b_text = document.getElementById('b_text')
const c_text = document.getElementById('c_text')
const d_text = document.getElementById('d_text')
const submitBtn = document.getElementById('submit')


let currentQuiz = 0
let score = 0

loadQuiz()

function loadQuiz() {

    deselectAnswers()

    const currentQuizData = quizData[currentQuiz]

    questionEl.innerText = currentQuizData.question
    a_text.innerText = currentQuizData.a
    b_text.innerText = currentQuizData.b
    c_text.innerText = currentQuizData.c
    d_text.innerText = currentQuizData.d
}

function deselectAnswers() {
    answerEls.forEach(answerEl => answerEl.checked = false)
}

function getSelected() {
    let answer
    answerEls.forEach(answerEl => {
        if (answerEl.checked) {
            answer = answerEl.id
        }
    })
    return answer
}


submitBtn.addEventListener('click', () => {
    const answer = getSelected()
    if (answer) {
        if (answer === quizData[currentQuiz].correct) {
            score++
        }

        currentQuiz++

        if (currentQuiz < quizData.length) {
            loadQuiz()
        } else {
            quiz.innerHTML = `
           <h2>You answered ${score}/${quizData.length} questions correctly</h2>

           <button onclick="location.reload()">Reload</button>
           `
        }
    }
}
)