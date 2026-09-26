class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.001205.fbee2e9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-001205-fbee2e9/marvel-darwin-arm64"
    sha256 "2eac93eef42b38a35293b7705e469cb4b5ac17b041f3bdc5d0aa7365cb79ad52"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-001205-fbee2e9/marvel-darwin-amd64"
    sha256 "42cd822cbc2282a4c2ff119d237a973ce3f04851f02e0b230c4e5d76102bf915"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-001205-fbee2e9/marvel-linux-arm64"
    sha256 "abeee776b7749c0aac788947e6bf6ec99371d8755a7829bfca11ba4470aebf13"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-001205-fbee2e9/marvel-linux-amd64"
    sha256 "7fb460b57b795e50b3e4002730372d076d3f98b62b6528d92469efb13c52b020"
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
