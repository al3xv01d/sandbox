var list = {

    parent: document.querySelector('body'),
    p: document.createElement('div'),


    createQuestion: function (answer) {

        this.p.innerHTML = answer;
        this.parent.appendChild(this.p);

    },

    createAnswer: function (num, answers) {
        
        for (i = 0; i < answers.length; i++) {

            var input = document.createElement('input');
            input.type = 'checkbox';

            var text = document.createElement('span');
            text.innerHTML = answers[i] + '<br>';


            this.parent.appendChild(input);
            this.parent.appendChild(text);
        }

    }
};

list.createQuestion('How are you?');
list.createAnswer(3, ['fdf', 'sdfsdf', 'sdfs']);