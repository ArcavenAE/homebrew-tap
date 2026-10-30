class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.233634.ed2aa17"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-233634-ed2aa17/marvel-darwin-arm64"
    sha256 "6921b45ca5aabc06df7236daf0b12dbb8cfad7e9d85d1547f8e646bf352d4784"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-233634-ed2aa17/marvel-darwin-amd64"
    sha256 "1c4e51b1ab914502c20626afd5074b468f58db8a404633a7c6f02069a2811236"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-233634-ed2aa17/marvel-linux-arm64"
    sha256 "701c249c732f7cf6eecf77bc11eb337e19f83c06987b354d41de1fe465fce8e3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-233634-ed2aa17/marvel-linux-amd64"
    sha256 "7972f9dfd1e25ff713c94f564056c9e95fc041562688aece7c55ffb5673b8d5c"
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
