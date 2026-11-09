class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.032926.bd2babc"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-032926-bd2babc/marvel-darwin-arm64"
    sha256 "f3ec85f9c56cfc1622510df1112f1f40b0f62527f39450a771963bd4162c2ec1"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-032926-bd2babc/marvel-darwin-amd64"
    sha256 "592d70e59e854820ad0ac55a94942b6f1923980583e61bf158ceb9d7cc797905"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-032926-bd2babc/marvel-linux-arm64"
    sha256 "1964dacc49b619d685f8d0fb2fda301b93dc1711b5469863f0888c69d7c8cd3e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-032926-bd2babc/marvel-linux-amd64"
    sha256 "051a74a7f688c694dd81aaf6a6da886fe2bac313cc8074578ae5038a75dd8565"
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
