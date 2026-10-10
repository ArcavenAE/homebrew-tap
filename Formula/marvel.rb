class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.202720.9bb2cf0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202720-9bb2cf0/marvel-darwin-arm64"
    sha256 "83c86c1c8266edce3a265001a35730ae82de08b01d7f0d837fd49943bdec17e5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202720-9bb2cf0/marvel-darwin-amd64"
    sha256 "76c920bc6d95a96b79895f37ff38ac9764a2c669a297e60af7023ae00cdf188e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202720-9bb2cf0/marvel-linux-arm64"
    sha256 "12ee917cc1beb19deace35676c02744a57b4a1abdc8f128a0b08c329780e6f2b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-202720-9bb2cf0/marvel-linux-amd64"
    sha256 "d9370144f74ca96a2ecab88f7b53a87089f780f42ea5a3f54bf4c7df2e1c5233"
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
