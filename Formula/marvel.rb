class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261110.225811.abc13ab"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-225811-abc13ab/marvel-darwin-arm64"
    sha256 "2a2ee1e1700d85e5137185a0a93681b91b8da214d784ef64b08254ca54358219"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-225811-abc13ab/marvel-darwin-amd64"
    sha256 "b5376f4ee1eac53494821c8aa4e809aa5b2d283aabc3cc6ab99f4c3168dff164"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-225811-abc13ab/marvel-linux-arm64"
    sha256 "cdcc85cab029d3cd4132e772bee41b6ec1b7ae12cafbb08a846e2ecd4452fafe"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261110-225811-abc13ab/marvel-linux-amd64"
    sha256 "7034061fd5861f19a8fa715a448d7af9f45eeb201714ba54dc924fdf7f777fb8"
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
