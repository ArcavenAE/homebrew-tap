class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261028.095404.46aa845"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-095404-46aa845/marvel-darwin-arm64"
    sha256 "b1f7eeb9de3243499a88b3e509cb0ba74e5e4eacf1a7c5a97d6590e4c4d898f9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-095404-46aa845/marvel-darwin-amd64"
    sha256 "5a76f962896f89cecf6544e20a50860354c50f78ad48afe67a81298cc639c406"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-095404-46aa845/marvel-linux-arm64"
    sha256 "5dc0f101b982e5659f2d47358a917ef694be39c21ab957a380d906265cb51811"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-095404-46aa845/marvel-linux-amd64"
    sha256 "76aca7163215bac04385a88e2f175257114fa47ccd51b0a177e53684643d9871"
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
