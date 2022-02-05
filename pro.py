class Wizard:
    def __init__(self, a, b, c):
        self.name = a
        self.rating = b
        self.age = c

    def change_rating(self, x):
        self.rating = max(min(100, self.rating + x), 1)
        if x > 0:
            self.age = max(18, self.age - x // 10)
        else:
            self.age += abs(x) // 10

    def __call__(self, x):
        return (x - self.age) * self.rating

    def __str__(self):
        return ' '.join(['Wizard', self.name, 'with', str(self.rating), 'rating looks', str(self.age), 'years old'])

    def __add__(self, s):
        if isinstance(s, str):
            self.rating = min(100, self.rating + len(s))
            self.age = max(18, self.age - len(s) // 10)
            return self

    def __eq__(self, other):
        return [self.rating, self.age, self.name] == [other.rating, other.age, other.name]

    def __ne__(self, other):
        return [self.rating, self.age, self.name] != [other.rating, other.age, other.name]

    def __lt__(self, other):
        return [self.rating, self.age, self.name] < [other.rating, other.age, other.name]

    def __le__(self, other):
        return [self.rating, self.age, self.name] <= [other.rating, other.age, other.name]

    def __gt__(self, other):
        return [self.rating, self.age, self.name] > [other.rating, other.age, other.name]

    def __ge__(self, other):
        return [self.rating, self.age, self.name] >= [other.rating, other.age, other.name]
