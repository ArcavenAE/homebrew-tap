class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.193447.42a1151"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-193447-42a1151/marvel-darwin-arm64"
    sha256 "1c539baef08a347e1a50ede9724dd067ca27dd38f9f8c5b35cd6ac07336df479"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-193447-42a1151/marvel-darwin-amd64"
    sha256 "59ab18d1e97a15ec98adbeec156c6df0c45d0178012ccd26e3fbc2ad6d139c28"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-193447-42a1151/marvel-linux-arm64"
    sha256 "7bd8d519c8dd18cf18dcd9f66774669435c7c442620bbf8d2935c9702aa1249d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-193447-42a1151/marvel-linux-amd64"
    sha256 "99f406bd1bb31801a67a73a465585d4aa6a9e9ef47055791cc63804a3601bde1"
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
