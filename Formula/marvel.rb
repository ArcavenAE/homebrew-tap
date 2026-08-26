class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260826.040423.d341fc4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040423-d341fc4/marvel-darwin-arm64"
    sha256 "6cdffac5ddfd7bcc50430836d680655f051aaa13effade73996957d6be5d7367"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040423-d341fc4/marvel-darwin-amd64"
    sha256 "06876dc301f4fcbb663b9440598a298a60d66c3003bbf9ece867810140bc15c1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040423-d341fc4/marvel-linux-arm64"
    sha256 "6c627dcb70cca32bae620506435e2448c08a40db216009868313ce2af93cb54f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260826-040423-d341fc4/marvel-linux-amd64"
    sha256 "baa5e93b474a254b0d9d23de8ccba07fd73f539f0a585e790ae5c3aaa86a90c3"
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
