class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.061345.5ea4f90"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-061345-5ea4f90/marvel-darwin-arm64"
    sha256 "492d051c9e2026a83abc8206a5b4b61cc00e31690823875bae7281c7e10a31a4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-061345-5ea4f90/marvel-darwin-amd64"
    sha256 "ac36417f64619908fdc4edd6ba2d3de200df546944e9f52024713c9a1ce2149d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-061345-5ea4f90/marvel-linux-arm64"
    sha256 "9787a2b19293a1ddde766068b65ae278889de42187fe62cfab3356b143bcea5a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-061345-5ea4f90/marvel-linux-amd64"
    sha256 "0f651fbce21081259b66ce681aee7bee0bc0ff41ef423fba5196901f98f9cdba"
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
