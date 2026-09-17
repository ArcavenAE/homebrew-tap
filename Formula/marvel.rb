class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260917.204732.1d90952"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204732-1d90952/marvel-darwin-arm64"
    sha256 "a7569b56fdff00dfc95432e01956210bb67270582cf26de4f0bff0f559f8d0a2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204732-1d90952/marvel-darwin-amd64"
    sha256 "0f4483d481b28cf6daa4b1077044b2f5d0c31d8ff584ab3994fe913d154fe6e4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204732-1d90952/marvel-linux-arm64"
    sha256 "63b77a2f5088ade67cba0d1b60a84265b797868efd30488977c2794d20a5ca1a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260917-204732-1d90952/marvel-linux-amd64"
    sha256 "66aabb3acea17a6682bed8d6d326c82cd8c7f75385aac94edcda5e4173a11b22"
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
