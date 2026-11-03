class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261103.054411.cc6cceb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-054411-cc6cceb/marvel-darwin-arm64"
    sha256 "90799ac5bb2f02e0622e220fef803f4103658efb180c87fb474a8b4991d73bb7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-054411-cc6cceb/marvel-darwin-amd64"
    sha256 "a57a1b040d75850f25dae372b059db263a3de4f4b0c4fc15137f71f6f99c02d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-054411-cc6cceb/marvel-linux-arm64"
    sha256 "03750cb4d6608707bf5dd1a80caa83dcaa15b9fb3367e5961efa9681b3f8f7ee"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261103-054411-cc6cceb/marvel-linux-amd64"
    sha256 "1366f21a72c434af285d35b61889084c085b3f62ad8b04fd633a30290911e8b1"
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
