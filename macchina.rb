class Macchina < Formula
  desc "Basic system information fetcher, with a focus on performance and minimalism"
  homepage "https://github.com/Macchina-CLI/macchina"
  url "https://github.com/Macchina-CLI/macchina/archive/refs/tags/0.6.5.tar.gz"
  sha256 "cac97a5c6f61c5b8f5cb82cb19c8cc5db094d8465ad4a4fdddb5678c8e9827e2"
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
