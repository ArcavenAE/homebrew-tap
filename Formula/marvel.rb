class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260930.072940.4b2fd5c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-072940-4b2fd5c/marvel-darwin-arm64"
    sha256 "ce061cdfa03038da7220973bf39957c79c72057fd284b3c5c0a5d1d37258a481"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-072940-4b2fd5c/marvel-darwin-amd64"
    sha256 "f6937fd0d717a73c76988a21a4b1d15d73675af7a50588f917f77e07fc4e5d3a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-072940-4b2fd5c/marvel-linux-arm64"
    sha256 "5ae8a51ba3421f57a5c287e8b6c19487343d7697a78110d07e4eee543dc5f4b7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260930-072940-4b2fd5c/marvel-linux-amd64"
    sha256 "ae16bb8646a9334004a47b0d094d876a19575b9b99f48e72c3527b4bdbca6434"
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
