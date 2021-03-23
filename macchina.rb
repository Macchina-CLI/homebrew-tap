class Macchina < Formula
  desc "Basic system information fetcher, with a focus on performance and minimalism"
  homepage "https://github.com/grtcdr/macchina"
  url "https://github.com/grtcdr/macchina/archive/v0.6.1.tar.gz"
  sha256 "7c7306a8fd9851deb68434c9331b1cc9b4b4e5bc6401218d621d99fdf486709d"
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
