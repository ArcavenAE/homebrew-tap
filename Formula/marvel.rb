class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260826.214610.60b994b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-214610-60b994b/marvel-darwin-arm64"
    sha256 "ddbb93541b77042d62aad73f059815d4000483e61df9dbaed872336e1eaf24a6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-214610-60b994b/marvel-darwin-amd64"
    sha256 "33910b8d61c07785dc68705ba767d43a7f0ca834b057773fd84e131889f759e6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-214610-60b994b/marvel-linux-arm64"
    sha256 "7451b85cd302fb4cfa767a5375876955e81f7ed945d3a2d431175d0abf2423a1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-214610-60b994b/marvel-linux-amd64"
    sha256 "6e630ea55c489180faf8aacca2631d87eddf2ae7008bcb24a2293c740fc9d025"
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
