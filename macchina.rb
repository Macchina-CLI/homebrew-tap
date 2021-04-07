class Macchina < Formula
  desc "Basic system information fetcher, with a focus on performance and minimalism"
  homepage "https://github.com/Macchina-CLI/macchina"
  url "https://github.com/Macchina-CLI/macchina/archive/v0.6.6.tar.gz"
  sha256 "a53c09e152c7f30c6a7959423d14e84d76f2d4c2efec5077930b308e230e36dd"
  license "MIT"

  pour_bottle? do
    reason "The bottle needs the Xcode CLT to be installed."
    satisfy { MacOS::CLT.installed? }
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "macchina", "-b", "-p"
  end
end
