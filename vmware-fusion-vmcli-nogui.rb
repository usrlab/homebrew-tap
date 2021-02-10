# Documentation: https://github.com/iotd/vmware-fusion-vmcli-nogui
class VmwareFusionVmcliNogui < Formula
  desc "vmware fusion shortcut management scripts based on the vmrun cli."
  homepage "https://github.com/iotd/vmware-fusion-vmcli-nogui"
  url "https://github.com/iotd/vmware-fusion-vmcli-nogui/archive/fusion-vmcli-darwin_v1.0.2.tar.gz"
  sha256 "97be5de653fe2010b23819cedafbdb86e566c0f157d03fa162753a6f0a17ced3"
  license "MIT"

  # depends_on "cmake" => :build
  bottle :unneeded
 
  #keg_only :provided_by_macos

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    #system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    etc.install "fusion-vmcli.conf" => "fusion-vmcli.conf"

    bin.install "fusion-vmcli"
  end

  def caveats
    info = <<~EOS
    For the first time, You can edit the configuration file:
        vim #{HOMEBREW_PREFIX}/etc/fusion-vmcli.conf

    Default path is "/Users/$(whoami)/Documents/Virtual\ Machines.localized".
    s
    Custom paths are recommended,$(whoami) refers to the current login user name.
    For example custom path:
        kdir -p ~/VmwareFusionPro
        and set:
        vm_path="/Users/$(whoami)/VmwareFusionPro"
    EOS
    info
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test vmware-fusion-vmcli-nogui`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
    output = shell_output("#{bin}/fusion-vmcli -h 2>&1", 1)
    assert_match "identity_file", output
  end
end
