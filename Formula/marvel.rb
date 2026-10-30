class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.202930.b522059"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-202930-b522059/marvel-darwin-arm64"
    sha256 "4297c4a1fe91e42854905fc6a3c375bbeaa86a3fd4c0734911bc6b711401fdee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-202930-b522059/marvel-darwin-amd64"
    sha256 "45886ab65848ead929a66dd792109a795f83a3af9bcc1db398ca377cecfa01f4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-202930-b522059/marvel-linux-arm64"
    sha256 "d3703b9eab60b96995978e1179d377ab7547a1ec32a63ffec743318673b33cb6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-202930-b522059/marvel-linux-amd64"
    sha256 "46400a829f0279ac06a0962cc3574d9eeac0f3155c03c6a989ce0c238a9887ca"
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
