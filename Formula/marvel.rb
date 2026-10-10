class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.195701.74224ee"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-195701-74224ee/marvel-darwin-arm64"
    sha256 "7c522296a1bf566f654c9588355e66e015e9ce8183cb9fd2f0ebb14cc41e3b55"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-195701-74224ee/marvel-darwin-amd64"
    sha256 "cd0c3405f575d148fe12de40221bb35311b89cc7114e0adea7c884859c4c16f5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-195701-74224ee/marvel-linux-arm64"
    sha256 "4c7bc29878463594e9decf79a2584b24fc1b4a8df467cbf5231f6590113ba3c4"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-195701-74224ee/marvel-linux-amd64"
    sha256 "d293e523287787cf5ad54e524c65162ef58a7597a38055022da4e06ad73de72a"
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
