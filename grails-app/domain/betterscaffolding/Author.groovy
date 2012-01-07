package betterscaffolding

class Author {

    String lastName
    String firstName
    Gender gender

    static hasMany = [books: Book]

    static constraints = {
        lastName nullable: false, blank: false
        firstName nullable: false, blank: true
    }
}
