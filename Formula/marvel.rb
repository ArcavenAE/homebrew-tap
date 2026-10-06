class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.154905.bf73982"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-154905-bf73982/marvel-darwin-arm64"
    sha256 "fbf40d5983b6c7017bc58e659a392c204016e6c1abde1e721b52f3da95bcbe78"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-154905-bf73982/marvel-darwin-amd64"
    sha256 "6b892eeae45983b9551648b2be006681eb31597e74d6fc9ce3c4c855beebe267"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-154905-bf73982/marvel-linux-arm64"
    sha256 "a308d12328d6833c139d86f1767d87fa6710627ec046e222e4b1241a3e556e82"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-154905-bf73982/marvel-linux-amd64"
    sha256 "657668399d6d8f42128446c04553920385404cf132fc6aabe425313f2099dcaa"
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
