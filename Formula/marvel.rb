class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.134531.ee9faaf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134531-ee9faaf/marvel-darwin-arm64"
    sha256 "14a69aa9f00947322ac0af140711c764ed89830e05e3af93947d2808e0a440c4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134531-ee9faaf/marvel-darwin-amd64"
    sha256 "2daddb4c0a00cfe326a38a049db27283a01b3eaca1a9be940a572f1920c96678"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134531-ee9faaf/marvel-linux-arm64"
    sha256 "5ff677e073a9bef24c878599a86338acf55829c77686dc4ad56fb028b283d7f7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-134531-ee9faaf/marvel-linux-amd64"
    sha256 "247b158a350a8c9564eb2d9f78bcf3e06c99f6feb9667074b6bc188db7dcb395"
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
