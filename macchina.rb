class Macchina < Formula
  desc "Basic system information fetcher, with a focus on performance and minimalism"
  homepage "https://github.com/grtcdr/macchina"
  url "https://github.com/grtcdr/macchina/archive/v0.6.2.tar.gz"
  sha256 "a3ca59bf1099fbcf8d346bd2b490c9b4c69434f241bf2b3248f54c827a3bfe44"
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
