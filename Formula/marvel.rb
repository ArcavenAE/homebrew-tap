class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.135853.4fc4637"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-135853-4fc4637/marvel-darwin-arm64"
    sha256 "d460353a053176cffb408c5c123c522bd9b9f7db5d5b571462ea884134d7ca14"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-135853-4fc4637/marvel-darwin-amd64"
    sha256 "0e23ca6e145d3c366f597e7235197f71d12eb170b73d30e524b767c0ded28f3f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-135853-4fc4637/marvel-linux-arm64"
    sha256 "0b75d610ce76488d815a898b38a3c70aa431d923c50a1f71cd185e5771a0f8a8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-135853-4fc4637/marvel-linux-amd64"
    sha256 "8a2ad261053cd514ac89a5dc342eca33be1f7b90752ff01abe7f7f6aa753f79c"
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
