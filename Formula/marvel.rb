class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.075925.cc01fa2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-075925-cc01fa2/marvel-darwin-arm64"
    sha256 "6a27a5c42ae9749a7124fdc6918d3643c71103e8e461d2c323af6a89829c59a1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-075925-cc01fa2/marvel-darwin-amd64"
    sha256 "8bba9e17dc729cb92d5d81385d1cdc9676545399aac73d68f3965af47e1d0e6c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-075925-cc01fa2/marvel-linux-arm64"
    sha256 "35a443a73dc5917192964383971a699f02b4b259cfef23eadbed7606b5ec5637"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-075925-cc01fa2/marvel-linux-amd64"
    sha256 "861268c2bc405fd02880b7af3eacc9d886e075e498a14e448a57f0f770842a81"
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
