# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class VmwareFusionVmcliNogui < Formula
  desc "vmware fusion shortcut management scripts based on the vmrun cli."
  homepage "https://github.com/iotd/vmware-fusion-vmcli-nogui"
  url "https://github.com/iotd/vmware-fusion-vmcli-nogui/archive/fusion-vmcli-darwin_v1.0.1.tar.gz"
  sha256 "b4db02ef93599a06911b9368f399e3591466fd07cd023a70f2b0c6eec4d07a4c"
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
    bin.install "fusion-vmcli"
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
