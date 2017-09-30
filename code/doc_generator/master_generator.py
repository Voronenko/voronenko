class MasterGenerator(object):
    generator_classes = {
    }

    def __init__(self):
        # Instantantiate all the generators
        generators = {
        }
        for name, cls in self.generator_classes.iteritems():
            generators[name] = cls()
        self.generators = generators

    def generate_all(self):
        for name, generator in self.generators.iteritems():
            generator.generate()
