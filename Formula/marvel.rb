class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261016.215613.aa3b76b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-215613-aa3b76b/marvel-darwin-arm64"
    sha256 "7573b2fec1af75e552982d74295ed60d4d2bde66de9be18b6a6814a3011a4ce8"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-215613-aa3b76b/marvel-darwin-amd64"
    sha256 "8abaaddf88ff5eb32b89d309af4281cec202d92b0313f362b8dfb1230fd54c6d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-215613-aa3b76b/marvel-linux-arm64"
    sha256 "9ed1c79ef07d1a44910b2bc25e7656479caa2ceb15890f5cbd2eddef64f982da"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261016-215613-aa3b76b/marvel-linux-amd64"
    sha256 "3e056fc71be83dca7af0b42ec31b027c1793428556bf993f468aceb0321ddbb7"
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
