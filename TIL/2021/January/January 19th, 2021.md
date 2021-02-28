# January 19th, 2021.md

## python 
- [Attribute Exception](https://airbrake.io/blog/python/attributeerror)
-      ```
            except AttributeError as error:
                # Output expected AttributeErrors.
                Logging.log_exception(error)
            except Exception as exception:
                # Output unexpected Exceptions.
                Logging.log_exception(exception, False)

        ```
- [Exception Python Doc](https://docs.python.org/3/tutorial/errors.html)
    - 강제로 exception 발동
    - ```
        raise E
      ```
- [class inherit](https://www.w3schools.com/python/python_inheritance.asp)
    - ```
        class Student(Person):
            pass
      ```

- [python csv](https://docs.python.org/3/library/csv.html)
    - [python csv dictreader&dictwriter](https://docs.python.org/3/library/csv.html#csv.DictReader)
    
    - [python class attributes to dict](https://stackoverflow.com/questions/61517/python-dictionary-from-an-objects-fields)