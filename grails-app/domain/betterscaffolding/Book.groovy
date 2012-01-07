package betterscaffolding

class Book {

    String title
    Date publishingDate
    Boolean available

    static belongsTo = [author:Author]

    static constraints = {
    }
}
