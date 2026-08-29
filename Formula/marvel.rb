class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260829.002146.303d88c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002146-303d88c/marvel-darwin-arm64"
    sha256 "d5d51f85434790db6f161f947b4e8f0394efa8cef5a165cbc36c1c9e5b4d2bbc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002146-303d88c/marvel-darwin-amd64"
    sha256 "f60ca3af364a3a51fe04c9d795c54e2515cbb60b53eaf900945575baba67e027"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002146-303d88c/marvel-linux-arm64"
    sha256 "7d97e0294ef7f7f3756c175c44bcbe91fcd0ebbd49dbfa899b363f340698a744"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260829-002146-303d88c/marvel-linux-amd64"
    sha256 "ecf5408f97995e29197216cf94ff65235665e0d7057964969a853ff5ae838d07"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
