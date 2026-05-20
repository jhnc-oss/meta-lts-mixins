from oeqa.runtime.case import OERuntimeTestCase
from oeqa.core.decorator.depends import OETestDepends
from oeqa.runtime.decorator.package import OEHasPackage

class CgoHelloworldTest(OERuntimeTestCase):
    @OETestDepends(['ssh.SSHTest.test_ssh'])
    @OEHasPackage(['cgo-helloworld'])
    def test_cgohelloworld(self):
        cmd = "cgo-helloworld"
        status, output = self.target.run(cmd)
        msg = 'Exit status was not 0. Output: %s' % output
        self.assertEqual(status, 0, msg=msg)

        msg = 'Incorrect output: %s' % output
        self.assertEqual(output, "Hello, world!", msg=msg)
