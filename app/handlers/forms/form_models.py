from wtforms import Form, StringField, validators


class ExampleForm(Form):
    field = StringField(
        "field",
        [
            validators.InputRequired(),
        ],
    )
